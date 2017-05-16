
let rec reverse l = match l with | h::t -> [reverse t; h];;
