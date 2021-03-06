
public aspect Aspect2 {

	pointcut Pop(Stack stack): call(* *.pop()) && target(stack);

	pointcut Push(Stack stack, Object i): call(* *.push(Object)) && args(i) && target(stack);

	int size;

	before(Stack stack) : Pop(stack) {

		size = stack.size();

	}

	after(Stack stack) : Pop(stack) {
		size = size - 1;

		if (!stack.isEmpty()) {
			if (stack.size() != size) {
				System.out.println("This is real size  " + stack.size());
				System.out.println("This is supposed size  " + size);
				System.out.println("Erreur de la propriété 2");
			}
		}
	}

	before(Stack stack, Object i) : Push( stack,  i) {
		size = stack.size();

	}

	after(Stack stack, Object i) : Push( stack,  i) {
		size = size + 1;

		if (stack.size() != size) {
			System.out.println("Erreur de la propriété 2");
			System.out.println("This is supposed size  " + size);
			System.out.println("This is real size  " + stack.size());
		}
	}

}
