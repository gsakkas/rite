
let append x y = x :: y;;

let append x y = match y with | [] -> x | h::t -> h :: (append x t);;
