<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="InventoryWF.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
        
    <h2>Welcome to Customer Page!!</h2>

    <br />

    <h2><span class="badge badge-info btn-lg btn-block">Enter a New Customer</span></h2>
    <br />
 <!--   <div class="form-group row">
        <label for="customerNo" class="col-sm-2 col-form-label">Customer Number</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCustomerID" runat="server" placeholder="customerId" required  oninvalid="this.setCustomValidity('Please Enter Customer ID')"
       oninput="setCustomValidity('')" ></asp:TextBox>
             
        </div>
    </div>
    -->
    <div class="form-group row">
        <label for="customerName" class="col-sm-2 col-form-label">Customer Name</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCustomerName" runat="server" placeholder="Customer Name"  
                oninvalid="this.setCustomValidity('Please Enter Customer Name')"
                oninput="setCustomValidity('')"></asp:TextBox>
             <asp:RequiredFieldValidator ControlToValidate="txtCustomerName" Display="Static"
                ErrorMessage ="Name is Required." ID="lblCustomerNameError" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
            
        </div>
    </div>
    <div class="form-group row">
        <label for="city" class="col-sm-2 col-form-label">City</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="City" 
                oninvalid="this.setCustomValidity('Please Enter City')"
                oninput="setCustomValidity('')"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtCity" Display="Static"
                ErrorMessage="City is Required." CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
             
        </div>
       
    </div>
    <div class="form-group row">
          <label for="grade" class="col-sm-2 col-form-label">Grade</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtGrade" runat="server" placeholder="Grade" 
                oninvalid="this.setCustomValidity('Please Enter Grade')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtGrade" Display="Static"
                ErrorMessage ="Grade is Required." ID="RequiredFieldValidator1" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
           
        </div>
    </div>
    <div class="form-group row">
        <label for="salesmanNo" class="col-sm-2 col-form-label">Salesman Number</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtID" runat="server" placeholder="Salesman ID" 
                oninvalid="this.setCustomValidity('Please Enter Salesman ID')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtID" Display="Static"
                ErrorMessage ="Salesman ID is Required." ID="RequiredFieldValidator2" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
           
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10">
            <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Enter Customer"></asp:Button>  

               <h1><span class="badge badge-success btn-lg btn-block">Existing Customers</span></h1>

            <br />

            <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" DataKeyNames="customer_id" DataSourceID="tblCustomer">
                <Columns>
                    <asp:BoundField DataField="customer_id" HeaderText="customer_id" ReadOnly="True" SortExpression="customer_id" />
                    <asp:BoundField DataField="cust_name" HeaderText="cust_name" SortExpression="cust_name" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="grade" HeaderText="grade" SortExpression="grade" />
                    <asp:BoundField DataField="salesman_id" HeaderText="salesman_id" SortExpression="salesman_id" />
                </Columns>

               
    
                
            </asp:GridView>
            <asp:SqlDataSource ID="tblCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
       
            </div>
    </div>
</asp:Content>
