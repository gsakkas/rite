let append x xs =
  match x with
  | []   -> xs
  | h::t -> h :: t :: xs

let _ = append [1] [2]
