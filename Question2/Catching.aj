import java.util.*;
import ca.uqam.info.logic.LTLStringParser;
import ca.uqam.info.runtime.symbolic.SymbolicWatcher;

public aspect Catching {

	SymbolicWatcher w;

	Catching() {
		w = new SymbolicWatcher();
		w.setFormula(LTLStringParser.parseFromString(
				"G (!(([m1 /call/method] ((m1) = ({withdraw})) & ([a1 /call/act/value] ((a1) > 1000)))) U (G ([m2 /call/method] ((m2) = ({isApproved})))))"));
	}

	pointcut open(Bank _methtarget, int act) :
    call(void open(int)) && target(_methtarget) && args(act);

	void around(Bank _methtarget, int act) : open(_methtarget, act)
  {
		// long startDate = System.currentTimeMillis();
		String ficxml;
		ficxml = "<call>\n";
		ficxml += "  <method>open</method>\n";
		ficxml += "  <arg>\n";
		ficxml += "    <act>\n";
		ficxml += "      <value>" + thisJoinPoint.getArgs()[0] + "</value>\n";
		ficxml += "      <type>int</type>\n";
		ficxml += "    </act>\n";
		ficxml += "  </arg>\n";
		proceed(_methtarget, act);
		ficxml += "</call>\n";
		w.update(ficxml);

		switch (w.getOutcome()) {
		case FALSE:
			outComeFalse();
			break;
		}
		// System.out.println(ficxml);
		// long endDate = System.currentTimeMillis();
		// System.out.println(endDate - startDate+ " milli secondes.\n");

	}

	pointcut close(Bank _methtarget, int ac) :
    call(void close(int)) && target(_methtarget) && args(ac);

	void around(Bank _methtarget, int ac) : close(_methtarget, ac)
  {
		// long startDate = System.currentTimeMillis();
		String ficxml;
		ficxml = "<call>\n";
		ficxml += "  <method>close</method>\n";
		ficxml += "  <arg>\n";
		ficxml += "    <ac>\n";
		ficxml += "      <value>" + thisJoinPoint.getArgs()[0] + "</value>\n";
		ficxml += "      <type>int</type>\n";
		ficxml += "    </ac>\n";
		ficxml += "  </arg>\n";
		proceed(_methtarget, ac);
		ficxml += "</call>\n";
		w.update(ficxml);

		switch (w.getOutcome()) {
		case FALSE:
			outComeFalse();
			break;
		}
		// System.out.println(ficxml);
		// long endDate = System.currentTimeMillis();
		// System.out.println(endDate - startDate+ " milli secondes.\n");

	}

	pointcut withdraw(Bank _methtarget, int act, int amount) :
    call(void withdraw(int, int)) && target(_methtarget) && args(act, amount);

	void around(Bank _methtarget, int act, int amount) : withdraw(_methtarget, act, amount)
  {
		// long startDate = System.currentTimeMillis();
		String ficxml;
		ficxml = "<call>\n";
		ficxml += "  <method>withdraw</method>\n";
		ficxml += "  <arg>\n";
		ficxml += "    <act>\n";
		ficxml += "      <value>" + thisJoinPoint.getArgs()[0] + "</value>\n";
		ficxml += "      <type>int</type>\n";
		ficxml += "    </act>\n";
		ficxml += "  </arg>\n";
		ficxml += "  <arg>\n";
		ficxml += "    <amount>\n";
		ficxml += "      <value>" + thisJoinPoint.getArgs()[1] + "</value>\n";
		ficxml += "      <type>int</type>\n";
		ficxml += "    </amount>\n";
		ficxml += "  </arg>\n";
		proceed(_methtarget, act, amount);
		ficxml += "</call>\n";
		w.update(ficxml);

		switch (w.getOutcome()) {
		case FALSE:
			outComeFalse();
			break;
		}
		// System.out.println(ficxml);
		// long endDate = System.currentTimeMillis();
		// System.out.println(endDate - startDate+ " milli secondes.\n");

	}

	pointcut isApproved(Bank _methtarget, int act, int amt) :
    call(boolean isApproved(int, int)) && target(_methtarget) && args(act, amt);

	boolean around(Bank _methtarget, int act, int amt) : isApproved(_methtarget, act, amt)
  {
		// long startDate = System.currentTimeMillis();
		String ficxml;
		ficxml = "<call>\n";
		ficxml += "  <method>isApproved</method>\n";
		ficxml += "  <arg>\n";
		ficxml += "    <act>\n";
		ficxml += "      <value>" + thisJoinPoint.getArgs()[0] + "</value>\n";
		ficxml += "      <type>int</type>\n";
		ficxml += "    </act>\n";
		ficxml += "  </arg>\n";
		ficxml += "  <arg>\n";
		ficxml += "    <amt>\n";
		ficxml += "      <value>" + thisJoinPoint.getArgs()[1] + "</value>\n";
		ficxml += "      <type>int</type>\n";
		ficxml += "    </amt>\n";
		ficxml += "  </arg>\n";
		boolean ret = proceed(_methtarget, act, amt);
		ficxml += "</call>\n";
		w.update(ficxml);

		switch (w.getOutcome()) {
		case FALSE:
			outComeFalse();
			break;
		}
		// System.out.println(ficxml);
		// long endDate = System.currentTimeMillis();
		// System.out.println(endDate - startDate+ " milli secondes.\n");
		return ret;

	}

	private void outComeFalse() {
		{
			System.out.println("Un retrait de plus de 1000$ doit être approuvé");
		}
	}

}