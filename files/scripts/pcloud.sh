#!/usr/bin/bash

set -ouex pipefail

mkdir -p $HOME/AppImages

wget "https://p-lux2.pcloud.com/cBZB5mF1iZD0HBEf7ZZZJbpiXkZ2ZZSpZkZQjhxVZBzZ1RZ8pZ8RZNpZCFZbQZuzZt8ZlRZP4Z9LZOYZ67ZQRe85ZnmLws2refwV5J2tzoy09ByFYN1by/pcloud" -O ~/AppImages/pcloud

chmod +x ~/AppImages/pcloud
