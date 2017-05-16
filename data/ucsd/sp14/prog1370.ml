
let append y = match y with | [] -> [] | h::t -> h :: t;;

let append y = match y with | [] -> [] | h::t -> h :: (append t);;

let append x y = match y with | [] -> [] | h::t -> h :: (append x t);;
