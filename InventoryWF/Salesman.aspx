<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Salesman.aspx.cs" Inherits="InventoryWF.Salesman" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">


    <h2>Welcome to Salesman Page!!</h2>

    <br />

    <h2><span class="badge badge-info btn-lg btn-block">Enter a New Salesman</span></h2>
    <br />
  <!--  <div class="form-group row">
        <label for="salesmanNo" class="col-sm-2 col-form-label">Salesman Number</label>
        <div class="col-sm-10">
          
            <asp:TextBox class="form-control" ID="txtID" runat="server" placeholder="id" required
                oninvalid="this.setCustomValidity('Please Enter Salesman ID')"
                oninput="setCustomValidity('')"></asp:TextBox> 
        </div>
    </div> -->
    <div class="form-group row">
        <label for="salesmanName" class="col-sm-2 col-form-label">Salesman Name </label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtSalesmanName" runat="server" placeholder="Salesman Name"
                 oninvalid="this.setCustomValidity('Please Enter Salesman Name')"
                oninput="setCustomValidity('')"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtSalesmanName" Display="Static"
                ErrorMessage ="Name is Required." ID="lblSalesmanNameError" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 

        </div>
    </div>
    <div class="form-group row">
        <label for="city" class="col-sm-2 col-form-label">City</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="City" 
                oninvalid="this.setCustomValidity('Please Enter City')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtCity" Display="Static"
                ErrorMessage ="City is Required." ID="RequiredFieldValidator1" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
           
        </div>
    </div>
    <div class="form-group row">
        <label for="commission" class="col-sm-2 col-form-label">Commission</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCommission" runat="server" placeholder="Commission" 
                oninvalid="this.setCustomValidity('Please Enter Commission')"
                oninput="setCustomValidity('')"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="txtCommission" Display="Static"
                ErrorMessage ="Commission is Required." ID="RequiredFieldValidator2" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator> 
           
          
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Enter Salesman" ></asp:Button>
        </div>
    </div>

      <h1><span class="badge badge-success btn-lg btn-block">Existing Salesman</span></h1>

    <br />

    <asp:GridView ID="gvSalesman" runat="server"></asp:GridView>
</asp:Content>
