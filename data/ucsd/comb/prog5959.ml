
let rec assoc (d,k,l) =
  match l with | [] -> d | (x,y)::ly -> if k = x then y else ly;;
