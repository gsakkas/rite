
let rec concat w = match w with | [] -> "" | h::t -> h ^ (concat t);;

let _ = concat [("1", "2")];;
