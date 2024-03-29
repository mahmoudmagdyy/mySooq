import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sooq/core/vendor/viewobject/common/ps_value_holder.dart';

import '../../../../../../core/vendor/api/common/ps_status.dart';
import '../../../../../../core/vendor/constant/ps_dimens.dart';
import '../../../../../../core/vendor/provider/category/category_provider.dart';
import '../../../../../../core/vendor/viewobject/category.dart';
import '../../../../../custom_ui/category/component/horizontal/widgets/category_horizontal_list_item.dart';

class CategoryHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context);
    final PsValueHolder valueHolder =
        Provider.of<PsValueHolder>(context, listen: false);

    final bool isLoading =
        categoryProvider.currentStatus == PsStatus.BLOCK_LOADING;
    final int count = isLoading
        ? valueHolder.loadingShimmerItemCount!
        : categoryProvider.categoryList.data!.length;
    return Container(
      height:MediaQuery.of(context).size.height*0.54,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
        ),
          shrinkWrap: false,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: PsDimens.space8),
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return CustomCategoryHorizontalListItem(
              category: isLoading
                  ? Category()
                  : categoryProvider.categoryList.data![index],
              isLoading: isLoading,
            );
          }, ),
    );
  }
}
