    from django import forms
    from cadastro.models import Cadastro
    class CadastroForm(forms.ModelForm):
        class Meta:
            model = Cadastro
            fields = "__all__"
