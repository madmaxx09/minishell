Minishell
This project was about creating simple shell. 

To use:
- git clone this repo
- cd into it
- make
- ./minishell
- have fun trying to break it

Each input is treated in 3 steps, the input is tokenized and added to this structure:
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
