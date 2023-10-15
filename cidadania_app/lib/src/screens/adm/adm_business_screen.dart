import 'package:cidadania_app/src/controllers/adm_controller.dart';
import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/repositories/converter.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:cidadania_app/src/widgets/default_button_widget.dart';
import 'package:cidadania_app/src/widgets/default_dropdown_button_widget.dart';
import 'package:cidadania_app/src/widgets/default_radio_button_widget.dart';
import 'package:cidadania_app/src/widgets/default_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdmBusinessScreen extends StatefulWidget {
  const AdmBusinessScreen({Key? key,}) : super(key: key);

  @override
  State<AdmBusinessScreen> createState() => _AdmBusinessScreenState();
}

class _AdmBusinessScreenState extends State<AdmBusinessScreen> {
  final BusinessController businessController = Get.find();
  final AdmController admController = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController businessAddress = TextEditingController();
  TextEditingController businessGoogleMapsLink = TextEditingController();
  TextEditingController businessDescription = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? distric;
  String? profileImage;
  String? category;
  List<String> images = [];
  List<String> filters = [];
  bool worksAtHome = false;
  bool worksAtBusinessAddress = false;
  bool isUpdate = false;
  int? businessId;
  final _formKey = GlobalKey<FormState>();


  getData() async {
    BusinessModel? businessModel;
    isUpdate = Get.parameters.containsKey("id");
    if(isUpdate){
      businessId = int.parse(Get.parameters["id"] as String);
      businessModel = await businessController.getOnlyBusiness(businessId: businessId!);
    }
    if(businessModel != null){
      name.text = businessModel.name;
      businessName.text = businessModel.businessName;
      businessAddress.text = businessModel.address ?? "";
      businessGoogleMapsLink.text = businessModel.mapsLink ?? "";
      businessDescription.text = businessModel.description ?? "";
      whatsapp.text = businessModel.whatsapp ?? "";
      instagram.text = businessModel.instagram ?? "";
      phone.text = businessModel.phone ?? "";
      distric = businessModel.district;
      profileImage = businessModel.image;
      images = businessModel.images;
      worksAtHome = businessModel.delivery;
      worksAtBusinessAddress = businessModel.workatBusiness;
    }
  }


  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Edição de Perfil de Negócio",
                      textAlign: TextAlign.center,
                      style: CustomStyle.title,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      backgroundImage: profileImage == null
                      ? null
                      : MemoryImage(ConverterRepository.base64ToBytes(image: profileImage!)),
                      radius: 100,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DefaultButtonWidget(
                      title: "Mudar Imagem",
                      width: 150,
                      onTap: () async {
                        String? newProfileImage = await ConverterRepository.imagePickerToBase64();
                        if(newProfileImage != null) profileImage = newProfileImage;
                        setState(() {
                          
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: name,
                      label: "Nome",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: businessName,
                      label: "Nome do Negócio",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: businessDescription,
                      maxSize: 250,
                      maxLines: 4,
                      label: "Descrição do Negócio",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultDropdownButtonWidget(
                      label: "Selecione o bairro",
                      currentValue: distric,
                      items: ["Santo Antônio", "Jabuti","Santa Clara","Autodromo"],
                      onChanged: (newDistrict){
                        distric = newDistrict;
                        setState(() {
                          
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: businessAddress,
                      label: "Endereço do Negócio",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: businessGoogleMapsLink,
                      label: "Link do Google Maps",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultDropdownButtonWidget(
                      label: "Categoria Principal do Negócio",
                      currentValue: category,
                      items: ["Serviço", "Produtos"],
                      onChanged: (newDistrict){
                        distric = newDistrict;
                        setState(() {
                          
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultRadioButtonWidget(
                      list: [
                        DefaultRadioModel(value: worksAtBusinessAddress, label: "Atende no endereço do negócio"),
                        DefaultRadioModel(value: worksAtHome, label: "Atende em domicílio"),
                      ], 
                      labe: "Formas de Atendimento",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: whatsapp,
                      label: "Whatsapp",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: instagram,
                      label: "Instagram",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextFieldWidget(
                      controller: phone,
                      label: "Telefone",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Adicione fotos do negócio, você pode adicionar até 5 fotos",
                      textAlign: TextAlign.center,
                      style: CustomStyle.medium,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultButtonWidget(
                      title: "Adicionar Foto",
                      onTap: images.length >= 5 
                      ? null
                      : () async {
                        String? newImage = await ConverterRepository.imagePickerToBase64();
                        if(newImage != null){
                          if(images.length < 5){
                            images.add(newImage);
                            setState(() {
                              
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if(images.isNotEmpty)
                    Container(
                      height: 250,
                      child: ListView.separated(
                        itemCount: images.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(width: 10,),
                        itemBuilder: (context,index)=> Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 200,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(ConverterRepository.base64ToBytes(image: images[index])),
                                  onError: ((exception, stackTrace) => Container(height: 100,width: 100,color: CustomColors.cardBackgroud,))
                                )
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            DefaultButtonWidget(title: "Remover",
                            width: 100,
                            onTap: (){
                              images.removeAt(index);
                              setState(() {
                                
                              });
                            },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultButtonWidget(
                      title: "Salvar",
                      onTap: () async {
                        try{
                          if(_formKey.currentState!.validate() && category!= null){
                              var business = BusinessModel(
                                id: !isUpdate ? 0 : businessId!, 
                                name: name.text, 
                                address: businessAddress.text, 
                                mapsLink: businessGoogleMapsLink.text, 
                                businessName: businessName.text, 
                                category: category!, 
                                district: distric,
                                description: businessDescription.text,
                                delivery: worksAtHome, 
                                workatBusiness: worksAtBusinessAddress, 
                                images: images, 
                                image: profileImage,
                                filters: filters,
                                whatsapp: whatsapp.text,
                                instagram: instagram.text,
                                phone: phone.text,
                              );
                          BusinessModel? newBusiness;
                          if(isUpdate){
                            newBusiness = await admController.putUpdateBusiness(
                              businessId: int.parse(Get.parameters["id"] as String),
                              businessModel: business,
                            );
                          } else {
                            newBusiness = await admController.postAddBusiness(businessModel: business);
                          }
                          if(newBusiness != null){
                            if(isUpdate){
                              int indexWhere = businessController.business.indexWhere((element) => element.id == businessId);
                              if(indexWhere >= 0){
                                businessController.business[indexWhere] = newBusiness;
                                businessController.business.refresh();
                              }
                            } else {
                              businessController.business.add(newBusiness);
                              businessController.business.refresh();
                            }
                          }
                          Get.back();
                          }
                        } catch(e){
                          debugPrint(e.toString());
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
