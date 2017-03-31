package res;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class WinApi {
    private String id;
    private String nameAndParameters;
    private String procedureOrFunction;
    private String parameterTypes;
    private String returnType;
    private String act;

    public WinApi() {

    }

    public WinApi(String id, String nameAndParameters, String procedureOrFunction,
                  String parameterTypes, String returnType, String act) {
        this.id = id;
        this.nameAndParameters = nameAndParameters;
        this.procedureOrFunction = procedureOrFunction;
        this.parameterTypes = parameterTypes;
        this.returnType = returnType;
        this.act = act;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNameAndParameters() {
        return nameAndParameters;
    }

    public void setNameAndParameters(String nameAndParameters) {
        this.nameAndParameters = nameAndParameters;
    }

    public String getProcedureOrFunction() {
        return procedureOrFunction;
    }

    public void setProcedureOrFunction(String procedureOrFunction) {
        this.procedureOrFunction = procedureOrFunction;
    }

    public String getParameterTypes() {
        return parameterTypes;
    }

    public void setParameterTypes(String parameterTypes) {
        this.parameterTypes = parameterTypes;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }

    public String getAct() {
        return act;
    }

    public void setAct(String act) {
        this.act = act;
    }
}
