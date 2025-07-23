CASM	= nasm
CFLAGS	= -f elf64 -Wx -Werror

RM		= rm -f

NAME	= libasm.a

SRC = Colleen.s

all: $(NAME)

$(NAME): $(SRC)
	$(CASM) $(CFLAGS) -o $@ $^

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus