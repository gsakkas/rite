type 'a lst = Null
            | Cons of 'a * 'a lst

let x = [3]

let rec append lst1 lst2= 
    match lst1 with
      Null -> lst2
    | Cons(x,rest) -> Cons(x, append rest lst2)

let y = Cons(4, Null)

let _ = append x y
