
type 'a set =
  | Set of 'a list;;

let empty = Set [(false, false)];;

let s0 = empty;;

let _ = ((List.mem 1 s0), (List.mem 2 s0));;
