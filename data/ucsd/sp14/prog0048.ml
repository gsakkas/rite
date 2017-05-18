
let append x y = x :: y;;

let append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let append y = match y with | [] -> [] | h::t -> h :: (append t);;
