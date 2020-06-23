public enum Markets.ViewMode {
    PRESENTATION,
    SELECTION
}

public enum Markets.SelectionMode {
    NONE,
    ALL,
}

public class Markets.State : Object {
    public Markets.ViewMode viewMode {
        get;
        set;
        default = Markets.ViewMode.PRESENTATION;
    }

    public Markets.SelectionMode selectionMode {
        get;
        set;
        default = Markets.SelectionMode.NONE;
    }

    public int totalSelected {
        get;
        set;
        default = 0;
    }
}
