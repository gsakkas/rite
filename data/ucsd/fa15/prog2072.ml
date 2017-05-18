
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t | _ -> d;;
