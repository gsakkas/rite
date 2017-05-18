
let rec concat xs = match xs with | [] -> "" | h::t -> concat t List.append h;;
