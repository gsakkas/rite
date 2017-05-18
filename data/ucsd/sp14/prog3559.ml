
let rec pipe fs = match fs with | x::[] -> x | h::t -> h (pipe t);;
