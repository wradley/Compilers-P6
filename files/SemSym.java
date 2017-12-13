import java.util.*;

/**
 * The Sym class defines a symbol-table entry. 
 * Each Sym contains a type (a Type).
 */
public class SemSym {
    private Type type;
    private int offset; // offset of 0 is for globals
    
    public SemSym(Type type) {
        this.type = type;
    }
    
    // May be used if more simple then setting the offset
    public SemSym(Type type, int s) {
    	this.type = type;
    	this.offset = s;
    }
    
    public void setOffset(int s) {
    	offset = s;
    }
    public int getOffset() {
    	return offset;
    }
    public Type getType() {
        return type;
    }
    
    public String toString() {
        return type.toString();
    }
}

/**
 * The FnSym class is a subclass of the Sym class just for functions.
 * The returnType field holds the return type and there are fields to hold
 * information about the parameters.
 */
class FnSym extends SemSym {
    // new fields
    private Type returnType;
    private int numParams;
    private List<Type> paramTypes;
    private int totalSize;
    
    public FnSym(Type type, int numparams) {
        super(new FnType());
        returnType = type;
        numParams = numparams;
    }

    public void addFormals(List<Type> L) {
        paramTypes = L;
    }
    
    public Type getReturnType() {
        return returnType;
    }

    public int getNumParams() {
        return numParams;
    }

    public List<Type> getParamTypes() {
        return paramTypes;
    }

    // Total size of functions PARAMETERS
    public int getParamSize() {
    	// Check for debugging purposes
    	if(paramTypes == null) {
    		System.out.println("Formals have not yet been added.");
    		return 0;
    	}
    	int count = 0;
    	for(int i = 0; i < paramTypes.size(); i++) {
    		count+=4;
    	}
    	return count;
    }
    
    public String toString() {
        // make list of formals
        String str = "";
        boolean notfirst = false;
        for (Type type : paramTypes) {
            if (notfirst)
                str += ",";
            else
                notfirst = true;
            str += type.toString();
        }

        str += "->" + returnType.toString();
        return str;
    }

    // Total size of functions LOCAL variables
	public void setTotalSize(int ts) {
		totalSize = ts;
	}
	
	public int getTotalSize() {
		return totalSize;
	}
}

/**
 * The StructSym class is a subclass of the Sym class just for variables 
 * declared to be a struct type. 
 * Each StructSym contains a symbol table to hold information about its 
 * fields.
 */
class StructSym extends SemSym {
    // new fields
    private IdNode structType;  // name of the struct type
    
    public StructSym(IdNode id) {
        super(new StructType(id));
        structType = id;
    }

    public IdNode getStructType() {
        return structType;
    }    
}

/**
 * The StructDefSym class is a subclass of the Sym class just for the 
 * definition of a struct type. 
 * Each StructDefSym contains a symbol table to hold information about its 
 * fields.
 */
class StructDefSym extends SemSym {
    // new fields
    private SymTable symTab;
    
    public StructDefSym(SymTable table) {
        super(new StructDefType());
        symTab = table;
    }

    public SymTable getSymTable() {
        return symTab;
    }
}
