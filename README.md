Minishell
This project was about creating simple shell. 

To use:
- git clone this repo
- cd into it
- make
- ./minishell
- have fun trying to break it

Each input is treated in 3 steps:
1 : the input is tokenized and added to this structure:

    typedef enum s_tokens
    {
    	INPUT,
    	OUTPUT,
    	HEREDOC,
    	APPEND,
    	PIPE,
    	STR
    }	t_token_type;
    
    typedef struct s_token
    {
    	t_token_type	type;
    	char			*content;
    	struct s_token	*next;
    	struct s_token	*prev;
    	int				quoted_heredoc;
    }	t_token;
    
2 : Each token goes into the expander if needed

3 : This list of token is then organised in an AST (abstract syntax tree) the result is a list of "commands" each node looks like this:

    typedef struct s_imple_cmd
    {
    	char			**args;
    	char			*path_to_cmd;
    	t_files_list	*input;
    	t_files_list	*output;
    	char			*heredoc_string;
    	int				append_mode;
    	int				heredoc;
    	t_simple_cmd	*prev;
    	t_simple_cmd	*next;
    
    }	t_simple_cmd;
