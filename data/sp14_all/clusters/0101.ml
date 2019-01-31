CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])
match n with
| n -> [n]
match l with
| [] -> []
| b :: [] -> [b]
match l with
| [] -> []
| b :: [] -> [b]
match a with
| [] -> []
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third :: fourth :: fifth -> [fourth ; third ; tail ; head]
match l with
| [] -> []
