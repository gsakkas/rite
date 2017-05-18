
let append x y = x + y;;

let append x y = match y with | [] -> [] | h::t -> h :: (append x t);;
