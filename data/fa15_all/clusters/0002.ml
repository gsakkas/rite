TupleG [ListG [],ListG []]
(0 , [])
(0 , mulByDigit x l1)
(e1 , x , y)
(fun x -> (x , f x = x) , b)
(f x , x = f x)
(0 , [0])
((mult (m , n) + y) / 10 , [(mult (m , n) + y) mod 10] @ z)
(l1 @ clone 0 diff , l2)
(l1 , l2 @ clone 0 diff)
(l1 , l2)
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: accList)
(l1 , clone 0 n @ l2)
(clone 0 (0 - n) @ l1 , l2)
(List.append (clone 0
                    (padLength l1 l2)) l1 , l2)
(l1 , List.append (clone 0
                         (padLength l1 l2)) l2)
(0 , depth)
(b , true)
(b , false)
(f b , f b = b)
(b , f b = b)
(fun x -> (b , f b = b) , b)
(xx , xx = x)
(f x , isFPoint x)
(0 , 0)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
(if ((a1 + x1) + x2) >= 10
 then 1
 else 0 , ((a1 + x1) + x2) :: a2)
(clone 0 n @ l1 , l2)
(clone 0 n @ l2 , l1)
(padZero l1 l2 , l2)
(num / 10 , [num mod 10] @ list)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
(l1 , clone 0 z @ l2)
(clone 0 z @ l1 , l2)
EMPTY
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
(0 :: l1 , l2)
(l1 , 0 :: l2)
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
(f b , false)
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
(true , b)
(false , f b)
(false , x)
(true , f2 x)
(f , b')
(fun b ->
   (f b , f b <> b) , b)
([] , [])
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
(y + z , b @ ([w mod 10] @ [w / 10]))
(fun x -> (f b , 3 < 4) , b)
(10 * o , bigAdd (mulByDigit o
                             l1) l)
((sum mod 10) :: a2 , (sum / 10) :: a1)
(a1 + 1 , bigAdd a2
                 (appZero a1 (mulByDigit x
                                         l2)))
(l1 , pad @ l2)
(pad @ l1 , l2)
(fun x ->
   (f b , not (b = f b)) , b)
(d , k , t)
(f b , b = f b)
(l1 , clone 0
            (len1 - len2) @ l2)
(fun x ->
   (f x , x <> f x) , b)
(0 , List.fold_left f base
                    args)
(clone 0 (0 - d) @ l1 , l2)
(l1 , clone 0 d @ l2)
(((num1 + num2) + carry) / 10 , (((num1 + num2) + carry) mod 10) :: sum)
(buildThresh (x7 , x8 , x9 , x0) , x , y)
(expr1 , x , y)
(f b , true)
(build (rand , d) , build (rand , d) , build (rand , d))
(e2 , x , y)
(e3 , x , y)
(fun input ->
   (let b = f input in
    (b , b <> input)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
([x1 + x2] , [x2])
([(x1 + x2) mod 10] , [(x1 + x2) / 10])
([(x1 + x2) / 10] , [(x1 + x2) mod 10])
(clone 0 (s2 - s1) , l2)
