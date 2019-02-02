type 'a lst = Null
            | Cons of 'a * 'a lst

let x = Cons(3, Null)

let rec append lst1 lst2= 
    match lst1 with
      Null -> lst2
    | Cons(x,rest) -> Cons(x, append rest lst2)

let _ = append ["a"] ["b"]
