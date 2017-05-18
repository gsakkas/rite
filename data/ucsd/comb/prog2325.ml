
let rec concat xs = match xs with | [] -> "" | h::t -> (concat t) @ h;;
