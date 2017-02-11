type 'a lst = Null
            | Cons of 'a * 'a lst

let x = Cons(3, Null)
let z = ["a"]
let k = ["k"]

let rec append lst1= 
    match lst1 with
      Null -> ()
    | Cons(x,rest) -> Cons(x, append rest lst2)

let y = Cons(4, Null)

let _ = append x
