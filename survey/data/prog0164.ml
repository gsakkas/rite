let append x l =
  match x with
  | []   -> l
  | h::t -> h :: t :: l

let _ = append [1] [2]
