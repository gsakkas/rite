
let rec concat w = match w with | [] -> "".[0] | h::t -> h ^ (concat t);;
