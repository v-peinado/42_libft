# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: victor <victor@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/03 14:27:33 by vpeinado          #+#    #+#              #
#    Updated: 2022/12/16 11:56:07 by victor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS  		= ft_bzero.c ft_isdigit.c ft_memcpy.c ft_strncmp.c ft_toupper.c \
				ft_isalnum.c ft_isprint.c ft_memset.c ft_strnstr.c \
				ft_isalpha.c ft_memchr.c ft_strchr.c ft_strrchr.c \
				ft_isascii.c ft_memcmp.c ft_strlen.c ft_tolower.c \
				ft_strlcpy.c ft_strnstr.c ft_memmove.c ft_atoi.c \
				ft_calloc.c ft_strdup.c ft_strlcat.c ft_strjoin.c \
				ft_putstr_fd.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
				ft_substr.c ft_striteri.c ft_strmapi.c ft_strtrim.c ft_split.c \
				ft_itoa.c

OBJS		= $(SRCS:.c=.o)

BONUS		= ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
				ft_lstiter.c ft_lstmap.c ft_lstclear.c ft_lstdelone.c \
				ft_lstadd_back.c

BONUS_OBJS	= $(BONUS:.c=.o)

CC			= gcc
RM			= rm -fr
CFLAGS		= -Wall -Wextra -Werror

NAME		= libft.a

all: 		$(NAME)

$(NAME):	$(OBJS)
			ar rcs $(NAME) $(OBJS)

clean:
					$(RM) $(OBJS) $(BONUS_OBJS)

fclean:				clean 
						$(RM) $(NAME)

re:					fclean $(NAME)

bonus:		$(OBJS) $(BONUS_OBJS)
			ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)

.PHONY:				all clean fclean re 