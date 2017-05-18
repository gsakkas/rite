
let rec concat xs = match xs with | [] -> "" | h::t -> h @ (concat t);;
