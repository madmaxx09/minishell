NAME = minishell

SRCS = srcs/token.c \
	   srcs/ast.c \
	   srcs/utils.c \
       srcs/main.c \
	   srcs/exec.c \
	   builtins/ft_cd.c \
	   builtins/ft_echo.c \
	   builtins/ft_exit.c \
	   builtins/ft_env.c \
	   builtins/ft_pwd.c \
	   builtins/ft_export.c \
	   builtins/ft_export2.c \
	   builtins/ft_export3.c \
	   builtins/ft_unset.c \
	   builtins/piece_of_cd.c \
	   srcs/expander.c \
	   srcs/custom_malloc.c \
	   srcs/heredoc.c \
	   srcs/error.c \
	   srcs/ast_utils.c \
	   srcs/path_utils.c \
	   srcs/process_tokens.c \
	   srcs/expander_utils.c \
	   srcs/heredoc_utils.c \
	   srcs/exec_utils.c \
	   srcs/libft_functions.c \
	   srcs/utils2.c \
	   srcs/utils3.c \
	   srcs/parsing_utils.c \
	   srcs/redirection.c \
	   srcs/copy_env.c \
	   srcs/no_gc_dups.c \
	   srcs/signals.c \
	   srcs/libft.c \
	   srcs/main_routine.c \
	   srcs/print_token_nodes.c \
	   srcs/token_utils.c \
	   srcs/token_adder.c \
	   srcs/token_handler.c \
	   srcs/expand_heredoc_utils.c \
	   srcs/dollar.c

OBJ_DIR = obj
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g -I /Users/$(USER)/.brew/opt/readline/include #-fsanitize=address -g

LDFLAGS = -lreadline -lhistory -L /Users/$(USER)/.brew/opt/readline/lib

RM = rm -rf

# Extracting subdirectories from SRCS
SUBDIRS = $(sort $(dir $(SRCS)))

# Create the directory structure in OBJ_DIR
OBJ_SUBDIRS = $(addprefix $(OBJ_DIR)/, $(SUBDIRS))

all: $(OBJ_SUBDIRS) $(NAME)

$(OBJ_SUBDIRS):
	@mkdir -p $@

${OBJ_DIR}/%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $(NAME)

clean:
	@$(RM) $(OBJ_DIR)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
