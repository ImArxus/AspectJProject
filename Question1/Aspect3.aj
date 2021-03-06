
public aspect Aspect3 {

	pointcut Pop(Stack stack): call(* *.pop()) && target(stack);

	pointcut Push(Stack stack, Object i): call(* *.push(Object)) && args(i) && target(stack);

	java.util.Stack<Object> stack2 = new java.util.Stack<Object>();

	after(Stack stack) returning(Object o) : Pop(stack) {
		Object res = stack2.pop();
		if (o != res) {
			System.out.println("expected  " + res + " but got " + o);
			System.out.println("Erreur de la propriété 3");
		}
	}

	before(Stack stack, Object i) : Push( stack,  i) {
		stack2.push(i);
	}

}
