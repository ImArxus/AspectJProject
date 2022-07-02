
public aspect Aspect1 {

	pointcut Pop(Stack stack): call(* *.pop()) && target(stack);

	pointcut Top(Stack stack): call(* *.top()) && target(stack);

	before(Stack stack) : Pop(stack) {
		if (stack.isEmpty()) {
			System.out.println("Erreur de la propriété 1");
		}
	}

	before(Stack stack) : Top(stack) {
		if (stack.isEmpty()) {
			System.out.println("Erreur de la propriété 1");
		}
	}

}
