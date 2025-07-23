CC		= gcc
CFLAGS	= -Wall -Wextra -Werror -g3 -O3

RM		= rm -f

NAME	= Sully

SRC = Sully.c

all: $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): ${SRC}
	$(CC) $(CFLAGS) -o $@ $^

fclean:
	$(RM) $(NAME)

re: fclean all

.PHONY: all fclean re