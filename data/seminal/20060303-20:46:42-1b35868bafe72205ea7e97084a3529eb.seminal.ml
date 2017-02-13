type 'a lst = Null
            | Cons of 'a * 'a lst

let x = Cons(3, Null)
let _ = print_string x
