# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/14 19:11:05 by paprzyby          #+#    #+#              #
#    Updated: 2024/05/31 09:03:41 by paprzyby         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=

SOURCE		=	client.c server.c

OBJECTS		=	$(SOURCE:.c=.o)

CC			=	cc

RM			=	rm -f

FLAGS		=	-Wall -Wextra -Werror

CLIENT		=	client

SERVER		=	server

all:			$(CLIENT) $(SERVER)

$(NAME):		all

$(SERVER):		server.o
				$(CC) $(FLAGS) -o $(SERVER) server.o

$(CLIENT):		client.o
				$(CC) $(FLAGS) -o $(CLIENT) client.o

%.o:			%.c
				$(CC) $(FLAGS) -c server.c -o server.o
				$(CC) $(FLAGS) -c client.c -o client.o

clean:
				$(RM) $(OBJECTS)

fclean:			clean
				$(RM) $(SERVER) $(CLIENT)

re:				fclean all

.PHONY:			all clean fclean re
