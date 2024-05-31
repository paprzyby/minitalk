# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/14 19:11:05 by paprzyby          #+#    #+#              #
#    Updated: 2024/05/31 11:58:49 by paprzyby         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=

SOURCE			=	client.c server.c

BONUS_SOURCE	=	client_bonus.c server_bonus.c

OBJECTS			=	$(SOURCE:.c=.o)

BONUS_OBJECTS	=	$(BONUS_SOURCE:.c=.o)

CC				=	cc

RM				=	rm -f

FLAGS			=	-Wall -Wextra -Werror

CLIENT			=	client

SERVER			=	server

BONUS_CLIENT	=	bonus_client

BONUS_SERVER	=	bonus_server

all:				$(CLIENT) $(SERVER) $(BONUS_CLIENT) $(BONUS_SERVER)

$(NAME):			all

$(CLIENT):			client.o
					$(CC) $(FLAGS) -o $(CLIENT) client.o

$(SERVER):			server.o
					$(CC) $(FLAGS) -o $(SERVER) server.o

$(BONUS_CLIENT):	bonus_client.o
					$(CC) $(FLAGS) -o $(CLIENT) bonus_client.o

$(BONUS_SERVER):	bonus_server.o
					$(CC) $(FLAGS) -o $(SERVER) bonus_server.o

%.o:				%.c
					$(CC) $(FLAGS) -c $< -o $@

clean:
					$(RM) $(OBJECTS)

fclean:				clean
					$(RM) $(SERVER) $(CLIENT) $(BONUS_CLIENT) $(BONUS_SERVER) $(BONUS_OBJECTS)

re:					fclean all

.PHONY:				all clean fclean re bonus

#NAME is not explicitly specified as a target.
#It seems to be intended as a variable to potentially hold a name,
#but it's not used in any of the rules or targets