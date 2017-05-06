package res;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class WinApi {
    private String id;
    private String nameAndParameters;
    private String act;

    public WinApi(String id, String nameAndParameters, String act) {
        this.id = id;
        this.nameAndParameters = nameAndParameters;
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

    public String getAct() {
        return act;
    }

    public void setAct(String act) {
        this.act = act;
    }
}
