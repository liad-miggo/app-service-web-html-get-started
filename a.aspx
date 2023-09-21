<%@ Page Language="C#" %>
<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvEnvironmentVariables.DataSource = GetEnvironmentVariablesTable();
            gvEnvironmentVariables.DataBind();
        }
    }

    private DataTable GetEnvironmentVariablesTable()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Variable", typeof(string));
        dt.Columns.Add("Value", typeof(string));

        IDictionary environmentVariables = Environment.GetEnvironmentVariables();
        foreach (DictionaryEntry entry in environmentVariables)
        {
            DataRow dr = dt.NewRow();
            dr["Variable"] = entry.Key.ToString();
            dr["Value"] = entry.Value.ToString();
            dt.Rows.Add(dr);
        }
        return dt;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Environment Variables</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>All Environment Variables:</h2>
            <asp:GridView ID="gvEnvironmentVariables" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
