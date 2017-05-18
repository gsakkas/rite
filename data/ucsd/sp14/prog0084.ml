
let rec listReverse l =
  match l with | [] -> l | (other::tail::[])::[] -> tail :: other;;
