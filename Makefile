# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivalimak <ivalimak@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/11 19:31:46 by ivalimak          #+#    #+#              #
#    Updated: 2025/01/29 16:44:47 by ivalimak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	putchar2

CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror

SRCS	=	main.c \
			putchar.c

OBJS	=	$(patsubst %.c, %.o, $(SRCS))

all: $(NAME)

$(NAME): $(OBJS)
	@echo Making putchar...
	@$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

standalone_putchar: _start.asm syscall.asm ft_putchar.c
	@echo Making standalone putchar...
	@as -g --fatal-warnings _start.asm -o _start.o
	@as -g --fatal-warnings syscall.asm -o syscall.o
	@gcc -g -Wall -Wextra -Werror -Wpedantic -pedantic-errors -std=c17 _start.o syscall.o ft_putchar.c -nostdlib -nostdinc -o $@

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

putchar: $(NAME)
	@./putchar2 putchar

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f standalone_putchar
	@rm -f $(NAME)

re: fclean putchar

.PHONY: putchar
