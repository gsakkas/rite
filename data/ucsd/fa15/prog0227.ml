
type 'a set =
  | Set of 'a list;;

let add x s = match s with | Set l -> l @ x;;

let hmm = Set [12; 23; 14; 56];;

let test = Set [1; 2; 3; 4; 5];;

let _ = add test hmm;;
