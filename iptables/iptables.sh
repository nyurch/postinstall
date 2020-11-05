#!/bin/bash

#Задаэмо змінні для спрощення скрипта
#==============================================================================
## Фаєрвол
export IPT="iptables"

## Інтерфейс із зовнішнім ip та сам ip
export WAN=eth0
export WAN_IP=127.0.0.1

## Локальні інтерфейс та мережа
export LAN1=eth1
export LAN1_IP_RANGE=10.0.0.0/24
#==============================================================================

#Базові налаштування
#==============================================================================
## Очистка правил
$IPT -F
$IPT -F -t nat
$IPT -F -t mangle
$IPT -X
$IPT -t nat -X
$IPT -t mangle -X

## Заборонити все що не дозволено
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

## Дозволити все для localhost та локальної мережі
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -i $LAN1 -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT
$IPT -A OUTPUT -o $LAN1 -j ACCEPT

## Дозволити ping
$IPT -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

## Дозволити трафік з внутрішньої мережі у світ
$IPT -A OUTPUT -o $WAN -j ACCEPT
## Розкоментувати щоб дозволити вхідні з'єднання сервера. Не рекомендовано.
# $IPT -A INPUT -i $WAN -j ACCEPT

## Дозволити встановлені та дочірні від них підключення
$IPT -A INPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A OUTPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
#==============================================================================

#Деякий захист від мамкиних хакерів
#==============================================================================
## Заборона неопізнаних пакетів
$IPT -A INPUT -m state --state INVALID -j DROP
$IPT -A FORWARD -m state --state INVALID -j DROP

## Нульових пакетів
$IPT -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

## Syn-flood
$IPT -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
$IPT -A OUTPUT -p tcp ! --syn -m state --state NEW -j DROP

## Заборона вказаних ip
#$IPT -A INPUT -s 1.1.1.1 -j REJECT
#==============================================================================

#Прокинути порт зі світу в локалку
#==============================================================================
## Вхідний на порт 12345 сервера прокинути на порт 3389 машини 10.0.0.2
# $IPT -t nat -A PREROUTING -p tcp --dport 12345 -i ${WAN} -j DNAT --to 10.0.0.2:3389
# Дозволяємо вхідний трафік на цей порт. Тому що всі вхідні заборонено трохи нижче $IPT -A FORWARD -i $WAN -o $LAN1 -j REJECT. Дозвіл повинен бути вище по тексту за заборону.
# $IPT -A FORWARD -i $WAN -d 10.0.0.2 -p tcp -m tcp --dport 3389 -j ACCEPT
#==============================================================================

#Обмін між світом і локалкою.
#==============================================================================
## Вихідні з локалки дозволено.
$IPT -A FORWARD -i $LAN1 -o $WAN -j ACCEPT
## Ззовні в локалку заборонено.
$IPT -A FORWARD -i $WAN -o $LAN1 -j REJECT
#==============================================================================

#Вмикаємо NAT для доступу локалки до світу
#==============================================================================
$IPT -t nat -A POSTROUTING -o $WAN -s $LAN1_IP_RANGE -j MASQUERADE
#==============================================================================

#Відкриваємо порти
#==============================================================================
## SSH
$IPT -A INPUT -i $WAN -p tcp --dport 22 -j ACCEPT

## Пошта
#$IPT -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
#$IPT -A INPUT -p tcp -m tcp --dport 465 -j ACCEPT
#$IPT -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
#$IPT -A INPUT -p tcp -m tcp --dport 995 -j ACCEPT
#$IPT -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
#$IPT -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT

## web-сервер
#$IPT -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
#$IPT -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

## DNS-сервер
#$IPT -A INPUT -i $WAN -p udp --dport 53 -j ACCEPT
#==============================================================================

#Ввімкнути логи
#==============================================================================
$IPT -N block_in
$IPT -N block_out
$IPT -N block_fw

$IPT -A INPUT -j block_in
$IPT -A OUTPUT -j block_out
$IPT -A FORWARD -j block_fw

$IPT -A block_in -j LOG --log-level info --log-prefix "--IN--BLOCK"
$IPT -A block_in -j DROP
$IPT -A block_out -j LOG --log-level info --log-prefix "--OUT--BLOCK"
$IPT -A block_out -j DROP
$IPT -A block_fw -j LOG --log-level info --log-prefix "--FW--BLOCK"
$IPT -A block_fw -j DROP
#==============================================================================

#Зберегти правила.
#==============================================================================
/sbin/iptables-save  > /etc/sysconfig/iptables
#==============================================================================ф
