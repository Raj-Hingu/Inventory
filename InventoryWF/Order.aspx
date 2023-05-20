<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="InventoryWF.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <h2>Welcome to Inventory Management System Orders!!</h2>

    <br /><br />

    <h2><span class="badge badge-info btn-lg btn-block">Enter a New Order</span></h2>
    <br />
  <!--  <div class="form-group row">
        <label for="orderNo" class="col-sm-2 col-form-label">Order Number</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtOrderID" runat="server" placeholder="orderId" required 
                oninvalid="this.setCustomValidity('Please Enter Order ID')"
                oninput="setCustomValidity('')"></asp:TextBox>
        </div>
    </div>
    -->
    <div class="form-group row">
        <label for="purchAmt" class="col-sm-2 col-form-label">Purchase Amount</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtPurchaseAmount" runat="server" placeholder="Purchase Amount"  
                oninvalid="this.setCustomValidity('Please Enter Purchase Amount')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtPurchaseAmount" Display="Static"
                ErrorMessage ="Purchase Amount is Required." ID="RequiredFieldValidator1" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
           
        </div>
    </div>
    <div class="form-group row">
        <label for="orderDate" class="col-sm-2 col-form-label">Order Date</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtOrderDate" runat="server" placeholder="yyyy-mm-dd"  
                oninvalid="this.setCustomValidity('Please Enter Order Date')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtOrderDate" Display="Static"
                ErrorMessage ="Order Date is Required." ID="RequiredFieldValidator2" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtOrderDate" ValidationExpression="^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$"
    ErrorMessage="Invalid date format." CssClass="text-danger" ValidationGroup="Group1" />
           
        </div>
    </div>

    <div class="form-group row">
        <label for="customerNo" class="col-sm-2 col-form-label">Customer Number</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCustomerID" runat="server" placeholder="Customer ID"  
                oninvalid="this.setCustomValidity('Please Enter Customer ID')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtCustomerID" Display="Static"
                ErrorMessage ="Customer ID is Required." ID="RequiredFieldValidator3" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
           
        </div>
    </div>
    <div class="form-group row">
        <label for="salesmanNo" class="col-sm-2 col-form-label">Salesman Number</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtID" runat="server" placeholder="Salesman ID"  
                oninvalid="this.setCustomValidity('Please Enter Salesman ID')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtID" Display="Static"
                ErrorMessage ="Salesman ID is Required." ID="RequiredFieldValidator4" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
           
        </div>
    </div>

     <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Enter Order"></asp:Button> 

    <h1><span class="badge badge-success btn-lg btn-block">Existing Orders</span></h1>

    <asp:GridView ID="tblOrder" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="order_no" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="order_no" HeaderText="order_no" ReadOnly="True" SortExpression="order_no" />
            <asp:BoundField DataField="purch_amt" HeaderText="purch_amt" SortExpression="purch_amt" />
            <asp:BoundField DataField="ord_date" HeaderText="ord_date" SortExpression="ord_date" />
            <asp:BoundField DataField="customer_id" HeaderText="customer_id" SortExpression="customer_id" />
            <asp:BoundField DataField="salesman_id" HeaderText="salesman_id" SortExpression="salesman_id" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" SelectCommand="SELECT * FROM [orders]" DeleteCommand="DELETE FROM [orders] WHERE [order_no] = @order_no" InsertCommand="INSERT INTO [orders] ([order_no], [purch_amt], [ord_date], [customer_id], [salesman__id]) VALUES (@order_no, @purch_amt, @ord_date, @customer_id, @salesman_id)" UpdateCommand="UPDATE [orders] SET [purch_amt] = @purch_amt, [ord_date] = @ord_date, [customer_id] = @customer_id, [salesman__id] = @salesman_id WHERE [order_no] = @order_no">
    <DeleteParameters>
        <asp:Parameter Name="order_no" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="order_no" Type="Int32" />
        <asp:Parameter Name="purch_amt" Type="Double" />
        <asp:Parameter Name="ord_date" Type="DateTime" />
        <asp:Parameter Name="customer_id" Type="Int32" />
        <asp:Parameter Name="salesman_id" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="purch_amt" Type="Double" />
        <asp:Parameter Name="ord_date" Type="DateTime" />
        <asp:Parameter Name="customer_id" Type="Int32" />
        <asp:Parameter Name="salesman_id" Type="Int32" />
        <asp:Parameter Name="order_no" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
