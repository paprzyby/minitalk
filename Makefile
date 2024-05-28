# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/14 19:11:05 by paprzyby          #+#    #+#              #
#    Updated: 2024/05/28 12:31:05 by paprzyby         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCE		=	client.c server.c

OBJECTS		=	$(SOURCE:.c=.o)

CC			=	cc

RM			=	rm -f

CFLAGS		=	-Wall -Wextra -Werror

CLIENT		=	client

SERVER		=	server

all:			$(CLIENT) $(SERVER)

%.o:			%.c
				$(CC) $(CFLAGS) -c $< -o $@

clean:
				$(RM) $(OBJECTS)

fclean:			clean
				$(RM)

re:				fclean all

.PHONY:			all clean fclean re
