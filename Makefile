# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivalimak <ivalimak@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/11 19:31:46 by ivalimak          #+#    #+#              #
#    Updated: 2023/11/11 19:40:06 by ivalimak         ###   ########.fr        #
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

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

putchar: $(NAME)
	@./putchar2 putchar

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)

re: fclean putchar

.PHONY: putchar
