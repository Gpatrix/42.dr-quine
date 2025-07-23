CC		= gcc
CFLAGS	= -Wall -Wextra -Werror -g3

RM		= rm -f

NAME	= Colleen

MANDATORY_SRCS = Colleen.c
MANDATORY_OBJS = $(MANDATORY_SRCS:.s=.o)

all: $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): $(MANDATORY_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	@$(RM) $(MANDATORY_OBJS)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re