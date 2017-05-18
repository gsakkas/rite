
let rec listReverse l = match l with | [] -> [] | a::l' -> listReverse @ a;;
