
let rec listReverse l = function | [] -> l | h::t -> listReverse (h :: l);;
